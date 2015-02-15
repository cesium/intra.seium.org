function initialize() {
var myLatlng = new google.maps.LatLng(41.561464, -8.397333);
var mapOptions = {
zoom: 18,
center: myLatlng,
mapTypeId: 'satellite'
};
var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
var marker = new google.maps.Marker({
position: myLatlng,
map: map,
title: 'SEI @ Departamento de Informática da Universidade do Minho'
});
map.setTilt(45);
}
google.maps.event.addDomListener(window, 'load', initialize);