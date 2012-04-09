root = exports ? this

stripHtml = (html) ->
    $("<div></div>").html(html).text()

entryTypes = {
    answers: {
        filter: "!*LJ9JtBkumiy6i6I",
        sort: "activity",
        targetProp: "answerText"
    },
    comments: {
        filter: "!7(OigrJ9",
        sort: "creation",
        targetProp: "commentText"
    }
}

class Grabber
    constructor: (@id) ->
        @site = "stackoverflow"
        @sort = "activity"

    fetchAnswers: () ->
        this._fetchTemplate("answers")

    fetchComments: () ->
        this._fetchTemplate("comments")

    _fetchTemplate: (type) ->
        map = entryTypes[type]
        $.ajax({
            url: "http://api.stackexchange.com/2.0/users/#{@id}/#{type}",
            dataType: "jsonp",
            data: {
                sort: map.sort,
                site: @site,
                order: "desc",
                filter: map.filter
            },
            success: (data) =>
                this[map.targetProp] = stripHtml(_.pluck(data.items, "body").join(' '))
        })

root.FlackOverstow = {
    Grabber
}
