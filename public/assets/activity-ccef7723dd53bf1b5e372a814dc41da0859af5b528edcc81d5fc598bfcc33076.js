
let turbolinkScrollY = 0

$(document).on('turbolinks:load', function () {
    // Enable Bootstrap tooltips
    $("[data-toggle='tooltip']").tooltip()

    // Enable smart scroll for turbolinks
    document.querySelectorAll("a").forEach(e => {
        if (e.getAttribute("href").includes(window.location.pathname) 
            && !e.getAttribute("href").includes("#")
            && !e.getAttribute("href").includes(window.location.pathname + "/")) {
            e.addEventListener("click", smartTurboScroll)
        }
    })
    if (turbolinkScrollY !== 0) {
        document.scrollingElement.scrollTo(0, turbolinkScrollY);
    }
    turbolinkScrollY = 0
});


const adjustForm = (showDistance) => {
    if (showDistance) {
        document.querySelector(".distance-wrapper").style.visibility = "visible"; 
    } else {
        document.querySelector(".distance-wrapper").style.visibility = "hidden"; 
        document.querySelector(".distance-wrapper input").value = "";
    }
}

const appendCurrentUrl = (k,v) => {
    const url = new URL(window.location.href)
    v ? url.searchParams.set(k, v) : url.searchParams.delete(k)
    return url
}

const smartTurboScroll = () => turbolinkScrollY = window.scrollY 

const activitiesFilterByName = () => {
    smartTurboScroll()
    const actiName = document.getElementById("filter").value
    Turbolinks.visit(appendCurrentUrl("by", actiName), { action: "replace" })
}

const activitiesFilterByDate = () => {
    smartTurboScroll()
    const since = document.getElementById("filter-since").value
    Turbolinks.visit(appendCurrentUrl("since", since), { action: "replace" })
};
