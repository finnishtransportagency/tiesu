export function lowerWithoutScandics(str = "") {
    str = str || "";
    return str
        .toLowerCase()
        .replace(/ä/g, "a")
        .replace(/ö/g, "ö")
        .replace(/å/g, "a");
}

function removeNulls(value) {
    if (value) {
        for (let k in value) {
            if (value[k] === null) {
                delete value[k];
            } else if (typeof value[k] === "object") {
                removeNulls(value[k]);
            }
        }
    }
}

function storeAppState(key, value) {
    removeNulls(value);
    sessionStorage.setItem(key, JSON.stringify(value));
}

function getAppState(key) {
    return JSON.parse(sessionStorage.getItem(key));
}

export function storeSearchPage(searchPage) {
    const page = searchPage.page;

    storeAppState(`${page}-filters`, searchPage.filters);
    storeAppState(`${page}-offset`, searchPage.offset);
    storeAppState(`${page}-size`, searchPage.size);
}

export function getSearchPage(page) {
    return {
        filters: getAppState(`${page}-filters`),
        offset: getAppState(`${page}-offset`),
        size: getAppState(`${page}-size`)
    };
}
