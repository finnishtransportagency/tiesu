import React from "react";
import { NavLink } from "react-router-dom";
import { fullURL } from "./App";

export class Selectbar extends React.Component {
    render() {
        return (
            <ul className="nav nav-pills">
                <li className="nav-item" key={"tiesuunnitelmat"}>
                    <NavLink
                        to={fullURL("/tiesuunnitelmat")}
                        className="nav-link"
                        activeClassName="active"
                    >
                        Tiesuunnitelmat
                    </NavLink>
                </li>
                <li className="nav-item" key={"yleissuunnitelmat"}>
                    <NavLink
                        to={fullURL("/yleissuunnitelmat")}
                        className="nav-link"
                        activeClassName="active"
                    >
                        Tien yleissuunnitelmat
                    </NavLink>
                </li>
                <li className="nav-item" key={"ratasuunnitelmat"}>
                    <NavLink
                        to={fullURL("/ratasuunnitelmat")}
                        className="nav-link"
                        activeClassName="active"
                    >
                        Ratasuunitelmat
                    </NavLink>
                </li>
                <li className="nav-item" key={"rautatienyleissuunnitelmat"}>
                    <NavLink
                        to={fullURL("/rautatienyleissuunnitelmat")}
                        className="nav-link"
                        activeClassName="active"
                    >
                        Rautatien yleissuunnitelmat
                    </NavLink>
                </li>
                <li className="nav-item" key={"yhteystiedot"}>
                    <NavLink
                        to={fullURL("/yhteystiedot")}
                        className="nav-link"
                        activeClassName="active"
                    >
                        Yhteystiedot
                    </NavLink>
                </li>
            </ul>
        );
    }
}
