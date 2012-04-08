root = exports ? this

stripHtml = (html) ->
    $("<div></div>").html(html).text()

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
            success: (data) =>
                @answerText = stripHtml(_.pluck(data.items, "body").join(' '))
        })

root.FlackOverstow = {
    Grabber
}
