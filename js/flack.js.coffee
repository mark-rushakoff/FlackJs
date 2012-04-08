root = exports ? this

class Grabber
    constructor: (@id) ->
        @site = "stackoverflow"
        @sort = "activity"

    url: () ->
        "http://api.stackexchange.com/2.0/users/#{@id}/answers?sort=#{@sort}&site=#{@site}&filter=!*LJ9JtBkumiy6i6I"

root.FlackOverstow = {
    Grabber
}
