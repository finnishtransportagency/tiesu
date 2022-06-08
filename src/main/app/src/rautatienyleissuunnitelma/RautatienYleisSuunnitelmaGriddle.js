import React from "react";
import CustomGriddle from "../grid/CustomGriddle";
import { RowDefinition, ColumnDefinition } from "griddle-react";
import { RautatienYleisSuunnitelmaFilter } from "./RautatienYleisSuunnitelmaFilter";
import { LinkToItem } from "../grid/CustomColumns";

export default class RautatienYleisSuunnitelmaGriddle extends React.Component {
    render() {
        const { dataStore } = this.props;

        return (
            <CustomGriddle
                dataStore={dataStore}
                customfilter={RautatienYleisSuunnitelmaFilter}
                modelName={dataStore.modelName.toLowerCase()}
            >
                <RowDefinition>
                    <ColumnDefinition
                        id="nimi"
                        modelName={dataStore.modelName.toLowerCase()}
                        width={"20%"}
                        customComponent={LinkToItem}
                        customHeadingComponent={() => null}
                    />
                    <ColumnDefinition
                        id="kuvaus"
                        width={"40%"}
                        customHeadingComponent={() => null}
                    />
                    <ColumnDefinition
                        id="tila"
                        customHeadingComponent={() => null}
                    />
                    <ColumnDefinition
                        id="suunnitelmanstatus"
                        customHeadingComponent={() => null}
                    />
                </RowDefinition>
            </CustomGriddle>
        );
    }
}
