import "babel-polyfill";
import "url-search-params-polyfill";
import React from "react";
import ReactDOM from "react-dom";
import { Router, Route } from "react-router-dom";
import { RouterStore, syncHistoryWithStore } from "mobx-react-router";
import createHashHistory from "history/createHashHistory";
import { Provider } from "mobx-react";

import App from "./App";
import { fullRestURL } from "./App";

import { TiesuunnitelmaStore } from "./stores/TieSuunnitelmaStore";
import { YleissuunnitelmaStore } from "./stores/YleisSuunnitelmaStore";
import { RautatienYleisSuunnitelmaStore } from "./stores/RautatienYleisSuunnitelmaStore";
import { RataSuunnitelmaStore } from "./stores/RataSuunnitelmaStore";
import notificationStore from "./stores/NotificationStore";

import "./styles/index.scss";

const hashHistory = createHashHistory();
const routingStore = new RouterStore();

const stores = {
    routing: routingStore,
    notificationStore: notificationStore,
    tieSuunnitelmaStore: TiesuunnitelmaStore.create(
        {},
        {
            restUrl: fullRestURL()
        }
    ),
    yleisSuunnitelmaStore: YleissuunnitelmaStore.create(
        {},
        {
            restUrl: fullRestURL()
        }
    ),
    rautatienYleisSuunnitelmaStore: RautatienYleisSuunnitelmaStore.create(
        {},
        {
            restUrl: fullRestURL()
        }
    ),
    rataSuunnitelmaStore: RataSuunnitelmaStore.create(
        {},
        {
            restUrl: fullRestURL()
        }
    )
};
const history = syncHistoryWithStore(hashHistory, routingStore);

if (process.env.NODE_ENV === "development") {
    console.log("Including VorlonJS");
    const script = document.createElement("script");
    script.src = `http://${window.location.hostname}:1337/vorlon.js`;
    script.async = true;
    document.head.appendChild(script);
}

ReactDOM.render(
    <Provider {...stores}>
        <Router history={history}>
            <div>
                <Route path={"/"} component={App} />
            </div>
        </Router>
    </Provider>,
    document.getElementById("root")
);
