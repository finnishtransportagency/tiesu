package fi.liike.rest.Model.linkitys;

import fi.liike.rest.Model.Haettava;

public class LinkitysHierarkia {
    private String lahdeNimi;
    private String kohdeNimi;
    private String lahdeTunnus;
    private String kohdeTunnus;
    private String lahdeTaulu;
    private String kohdeTaulu;


    public void setUp(Haettava child, Haettava parent) {
        this.lahdeNimi = child.getNimi();
        this.kohdeNimi = parent.getNimi();
        this.lahdeTunnus = child.getTunnus().toString();
        this.kohdeTunnus = parent.getTunnus().toString();
    }

    public String getLahdeNimi() {
        return lahdeNimi;
    }

    public String getKohdeNimi() {
        return kohdeNimi;
    }

    public String getLahdeTunnus() {
        return lahdeTunnus;
    }

    public String getKohdeTunnus() {
        return kohdeTunnus;
    }

    public void setLahdeTaulu(String lahdeTaulu) {
        this.lahdeTaulu = lahdeTaulu;
    }

    public void setKohdeTaulu(String kohdeTaulu) {
        this.kohdeTaulu = kohdeTaulu;
    }

    public String getLahdeTaulu() {
        return lahdeTaulu;
    }

    public String getKohdeTaulu() {
        return kohdeTaulu;
    }
}
