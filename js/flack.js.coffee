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
    },
    questions: {
        filter: "!0U1).AVuHTt(si6OTWa*fomjU",
        sort: "activity",
        targetProp: "questionText"
    }
}

fetchTemplate = (self, type) ->
    map = entryTypes[type]
    $.ajax({
        url: "http://api.stackexchange.com/2.0/users/#{self.id}/#{type}",
        dataType: "jsonp",
        data: {
            sort: map.sort,
            site: self.site,
            order: "desc",
            filter: map.filter
        },
        success: (data) =>
            self[map.targetProp] = stripHtml(_.pluck(data.items, "body").join(' '))
    })

class Grabber
    constructor: (@id) ->
        @site = "stackoverflow"
        @sort = "activity"

    fetchAnswers: () ->
        fetchTemplate(this, "answers")

    fetchComments: () ->
        fetchTemplate(this, "comments")

    fetchQuestions: () ->
        fetchTemplate(this, "questions")

root.FlackOverstow = {
    Grabber
}
