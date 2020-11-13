
$(document).on('turbolinks:load', function () {
    $("[data-toggle='tooltip']").tooltip()
});

const adjustForm = (showDistance) => {
    if (showDistance) {
        document.querySelector(".distance-wrapper").style.visibility = "visible"; 
    } else {
        document.querySelector(".distance-wrapper").style.visibility = "hidden"; 
        document.querySelector(".distance-wrapper input").value = "";
    }
}