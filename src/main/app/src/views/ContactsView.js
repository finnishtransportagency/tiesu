import React from "react";

const ContactsView = () => {
    const contact1 = {
        sector: "",
        contactPerson: {
            name: "Tomi Mykkänen",
            title: "Tietoarkkitehti",
            jobDescription: "Tietojärjestelmien kehittäminen",
            sectorDescription: "Toiminnan ohjaus",
            phone: "029 534 3052",
            mobile: "040 673 6562",
            email: "tomi.mykkanen@liikennevirasto.fi"
        }
    };

    const contactInfo = (contact, id) => {
        return (
            <div key={id} className="col-md-6">
                <h3>{contact.sector}</h3>
                {Object.entries(contact.contactPerson).map(function(
                    value,
                    idx
                ) {
                    const bold = value[0] === "name";
                    const val = value[1];
                    if (val === null) {
                        return <div key={id} />;
                    }
                    return (
                        <div key={`${id}-${idx}`}>
                            {bold && <h4>{`${val}`}</h4>}
                            {!bold && <p>{`${val}`}</p>}
                        </div>
                    );
                })}
            </div>
        );
    };

    const contacts = [contact1];

    return (
        <div className="contacts">
            <h2>Yhteystiedot</h2>
            <div className="form-group row">
                {contacts.map(function(contact, idx) {
                    return contactInfo(contact, idx);
                })}
            </div>
        </div>
    );
};

export { ContactsView };
