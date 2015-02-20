$(document).ready(function(){

config = {
    url: $("#share-button").data("image"),  // the url you'd like to share. [Default: `window.location.href`]
    title: "Semana da Engenharia Informática",      // title to be shared alongside your link 
    description: $("#share-button").data("description"),  // text to be shared alongside your link
    ui: {
        flyout: "bottom center",
    }
};
// G+ and Fb not receiving description arguments


var share = new Share("#share-button", config);

$("#share-button").hover(function(){
    share.open();
    }, function(){
    share.close();
}); 
});
