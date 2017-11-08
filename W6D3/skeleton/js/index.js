console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
    method: 'get',
    url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b',
    dataType: 'json',
    success: (r) => console.log(r)
});

// Add another console log here, outside your AJAX request
console.log('beans');
