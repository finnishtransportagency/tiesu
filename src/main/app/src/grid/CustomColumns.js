import React from "react";
import { Link } from "react-router-dom";
import { connect } from "react-redux";
import { fullURL } from "../App";

const CustomLink = ({ value, griddleKey, rowData, itemUrl = null }) => (
    <Link
        to={fullURL(itemUrl || rowData.itemUrl || "", rowData.tunnus)}
        className="name-link"
    >
        {rowData.nimi || griddleKey}
    </Link>
);

const CustomStatus = ({ value, griddleKey, rowData }) => (
    <div>{rowData.aktiivinen === 1 ? "Aktiivinen" : "Ei-aktiivinen"}</div>
);

const rowDataSelector = (state, { griddleKey }) => {
    return state
        .get("data")
        .find(r => r.get("griddleKey") === griddleKey)
        .toJSON();
};

const EnhanceWithRowData = connect((state, props) => ({
    rowData: rowDataSelector(state, props),
    itemUrl: props.cellProperties.modelName
        ? `/${props.cellProperties.modelName}/tunnus/`
        : null
}));

export const LinkToItem = EnhanceWithRowData(CustomLink);
export const ActiveStatus = EnhanceWithRowData(CustomStatus);
