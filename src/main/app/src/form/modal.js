import React from "react";

export const getModal = modal => {
    const cancelBtn = {
        text: modal.cancelBtn.text,
        onClick: modal.cancelBtn.onClick,
        className: modal.cancelBtn.className
    };
    const continueBtn = {
        text: modal.continueBtn.text,
        onClick: modal.continueBtn.onClick,
        className: modal.continueBtn.className
    };

    const buttons = [continueBtn, cancelBtn];

    return { buttons: buttons, header: modal.header, body: modal.body };
};

export const getRemoveSelectedModal = (noCallback, yesCallback) => {
    const modal = {
        cancelBtn: {
            text: "En",
            onClick: noCallback,
            className: "btn-danger"
        },
        continueBtn: {
            text: "Kyllä",
            onClick: yesCallback,
            className: "btn-primary"
        },
        header: "Haluatko varmasti poistaa valinnan?",
        body: null
    };
    return getModal(modal);
};

export const getCancelModal = (noCallback, yesCallback) => {
    const modal = {
        cancelBtn: {
            text: "En",
            onClick: noCallback,
            className: "btn-danger"
        },
        continueBtn: {
            text: "Kyllä",
            onClick: yesCallback,
            className: "btn-primary"
        },
        header: "Haluatko varmasti perua?",
        body: null
    };
    return getModal(modal);
};

export const getDeleteModal = (noCallback, yesCallback) => {
    const modal = {
        cancelBtn: {
            text: "En",
            onClick: noCallback,
            className: "btn-danger"
        },
        continueBtn: {
            text: "Kyllä",
            onClick: yesCallback,
            className: "btn-primary"
        },
        header: "Haluatko varmasti poistaa?",
        body: null
    };
    return getModal(modal);
};

export const getCreateNewModal = (cancelCallback, createCallback, content) => {
    const modal = {
        cancelBtn: {
            text: "Peruuta",
            onClick: cancelCallback,
            className: "btn-danger"
        },
        continueBtn: {
            text: "Tallenna",
            onClick: createCallback,
            className: "btn-primary"
        },
        header: null,
        body: content
    };
    return getModal(modal);
};

const Modal = ({ header, body, buttons, showModal }) => {
    return (
        (showModal && (
            <div className="modal">
                <div className="modal-dialog">
                    <div className="modal-content">
                        {header && (
                            <div className="modal-header">
                                <h4 className="modal-title">{header}</h4>
                            </div>
                        )}
                        {body && <div className="modal-body">{body}</div>}
                        {buttons && (
                            <div className="modal-footer">
                                {buttons.map(button => (
                                    <div key={button.text}>
                                        <button
                                            type="button"
                                            className={`btn ${
                                                button.className
                                            }`}
                                            onClick={button.onClick}
                                        >
                                            {button.text}
                                        </button>
                                    </div>
                                ))}
                            </div>
                        )}
                    </div>
                </div>
            </div>
        )) ||
        null
    );
};

export default Modal;
