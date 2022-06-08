import React from "react";
import { Collapse } from "react-collapse";

export class CustomCollapse extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            isOpen: props.isOpened || false
        };
    }

    toggle() {
        this.setState({ isOpen: !this.state.isOpen });
    }

    componentWillReceiveProps(nextProps) {
        this.setState({ isOpen: nextProps.isOpened });
    }

    render() {
        return (
            <div className="panel panel-default">
                <div className="panel-heading">
                    <i
                        className={
                            "fa fa-2x fa-angle-" +
                            (this.state.isOpen ? "up" : "down")
                        }
                        onClick={() => this.toggle()}
                    />
                    <h4>&nbsp;{this.props.header}</h4>
                </div>
                <Collapse isOpened={this.state.isOpen}>
                    <div className="panel-body">{this.props.children}</div>
                </Collapse>
            </div>
        );
    }
}
