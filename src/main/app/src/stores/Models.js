import {
    types,
    getSnapshot,
    flow,
    applySnapshot,
    addDisposer,
    onSnapshot,
    getEnv,
    destroy
} from "mobx-state-tree";
import axios from "axios";

export function createModel(modelName) {
    return types
        .model({
            tunnus: types.maybe(types.number, null)
        })
        .actions(self => {
            const { restUrl } = getEnv(self);
            const url = `${restUrl}/${modelName.toLowerCase()}`;

            return {
                afterAttach() {
                    addDisposer(self, onSnapshot(self, self.save));
                },
                save: flow(function*(params = null) {
                    if (!params) {
                        const snapshot = getSnapshot(self);
                        params = Object.keys(snapshot)
                            .map(
                                key =>
                                    `${key}: ${JSON.stringify(snapshot[key])}`
                            )
                            .join(", ");
                    }
                    const response = yield axios.put(`${url}`, {
                        ...params
                    });
                    return response;
                })
            };
        });
}

export function createCollectionType(collectionProperty, itemType, modelName) {
    return types
        .model({
            [collectionProperty]: types.optional(types.array(itemType), []),
            count: 0,
            offset: 0,
            size: 15
        })
        .views(self => ({
            get list() {
                return self[collectionProperty];
            },
            get modelName() {
                return modelName;
            },
            getOrFetch(tunnus) {
                if (!tunnus) return null;
                const item = self[collectionProperty].find(
                    item => item.tunnus === tunnus
                );
                if (!item) setTimeout(() => self.get(tunnus), 0);
                return item;
            }
        }))
        .actions(self => {
            const { restUrl } = getEnv(self);
            const url = `${restUrl}/${modelName.toLowerCase()}`;

            function createSearchParams(filters) {
                let searchParams = new URLSearchParams();
                Object.keys(filters).forEach(filterName => {
                    const param = filters[filterName];
                    if (!param) return;
                    if (param.constructor === Array) {
                        param.forEach(value => {
                            searchParams.append(filterName, value);
                        });
                    } else {
                        searchParams.append(filterName, param);
                    }
                });
                return searchParams;
            }

            return {
                createFromValues: flow(function*(params) {
                    const response = yield axios.post(`${url}`, {
                        ...params
                    });
                    // TODO maybe offset should stay same?
                    self.updateFromServer([response.data], 1);
                    return response;
                }),
                add: flow(function*(snapshot) {
                    if (!itemType.is(snapshot)) {
                        throw new Error(
                            "Invalid instance: " + JSON.stringify(snapshot)
                        );
                    }
                    const params = Object.keys(snapshot)
                        .filter(key => key !== "id")
                        .map(key => `${key}: ${JSON.stringify(snapshot[key])}`)
                        .join(", ");
                    const response = yield axios.post(`${url}`, {
                        ...params
                    });
                    // TODO maybe offset should stay same?
                    self.updateFromServer([response.data], 1);
                    return response;
                }),
                load: flow(function*() {
                    let params = new URLSearchParams();
                    params.append("offset", 0);
                    params.append("size", -1);
                    params.append("sort", "asc");
                    const response = yield axios.get(`${url}`, {
                        params: params
                    });
                    self.updateFromServer(
                        response.data.items,
                        response.data.count
                    );
                    return response;
                }),
                search: flow(function*(filters = {}, offset = 0, size = 15) {
                    let params = createSearchParams(filters);
                    params.append("offset", offset);
                    params.append("size", size);
                    params.append("sort", "asc");
                    const response = yield axios.get(`${url}`, {
                        params: params
                    });
                    self.updateFromServer(
                        response.data.items,
                        response.data.count,
                        offset
                    );
                    return response;
                }),
                get: flow(function*(tunnus) {
                    const response = yield axios.get(`${url}/${tunnus}`);
                    self.updateFromServer([response.data], 1);
                    return response;
                }),
                remove: flow(function*(tunnus) {
                    let response;
                    try {
                        response = yield axios.delete(`${url}/${tunnus}`);
                        destroy(tunnus);
                    } catch (error) {
                        console.error("Failed to delete model", error);
                    }
                    return response;
                }),
                updateFromServer(data = [], count = 0, offset = 0) {
                    applySnapshot(self, {
                        [collectionProperty]: data,
                        count: count,
                        offset: offset,
                        size: 15
                    });
                },
                beforeDestroy() {}
            };
        });
}
