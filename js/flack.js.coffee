root = exports ? this

class Grabber
    constructor: (@id) ->
        @site = "stackoverflow"
        @sort = "activity"

    fetch: () ->
        # This filter is from the SE API to only include the body field
        $.ajax({
            url: "http://api.stackexchange.com/2.0/users/#{@id}/answers",
            dataType: "jsonp",
            data: {
                sort: @sort,
                site: @site,
                filter: "!*LJ9JtBkumiy6i6I"
            },
            context: this,
            success: (data) ->
                console.log("data", data)
        })

root.FlackOverstow = {
    Grabber
}
