root = exports ? this

beforeEach ->
    spyOn($, "ajax")

describe "FlackOverstow", ->
    describe "Grabber", ->
        beforeEach ->
            @grabber = new root.FlackOverstow.Grabber(126042)

        it "initializes with the supplied id", ->
            expect(@grabber.id).toBe(126042)

        it "defaults the site to stackoverflow", ->
            expect(@grabber.site).toBe("stackoverflow")

        it "defaults the sort to activity", ->
            expect(@grabber.sort).toBe("activity")

        describe "#fetch", ->
            beforeEach ->
                @grabber.fetch()

            it "fetches from the correct url", ->
                ajaxArg = $.ajax.mostRecentCall.args[0]
                expect(ajaxArg.url).toBe("http://api.stackexchange.com/2.0/users/126042/answers")
                expect(ajaxArg.data.sort).toBe("activity")
                expect(ajaxArg.data.site).toBe("stackoverflow")
                expect(ajaxArg.data.filter).toBe("!*LJ9JtBkumiy6i6I")

            xdescribe "when the fetch completes"
