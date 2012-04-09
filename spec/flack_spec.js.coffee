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

        describe "#fetchAnswers", ->
            beforeEach ->
                @grabber.fetchAnswers()

            it "fetches from the correct url", ->
                ajaxArg = $.ajax.mostRecentCall.args[0]
                expect(ajaxArg.url).toBe("http://api.stackexchange.com/2.0/users/126042/answers")
                expect(ajaxArg.data.sort).toBe("activity")
                expect(ajaxArg.data.order).toBe("desc")
                expect(ajaxArg.data.site).toBe("stackoverflow")
                expect(ajaxArg.data.filter).toBe("!*LJ9JtBkumiy6i6I")

            describe "when the fetch completes", ->
                beforeEach ->
                    ajaxArgs = $.ajax.mostRecentCall.args[0]
                    ajaxArgs.success(FlackFixtures.answers)

                it "sets the answerText property", ->
                    expect(@grabber.answerText).toBeDefined()

        describe "#fetchComments", ->
            beforeEach ->
                @grabber.fetchComments()

            it "fetches from the correct url", ->
                ajaxArg = $.ajax.mostRecentCall.args[0]
                expect(ajaxArg.url).toBe("http://api.stackexchange.com/2.0/users/126042/comments")
                expect(ajaxArg.data.sort).toBe("creation")
                expect(ajaxArg.data.order).toBe("desc")
                expect(ajaxArg.data.site).toBe("stackoverflow")
                expect(ajaxArg.data.filter).toBe("!7(OigrJ9")

            describe "when the fetch completes", ->
                beforeEach ->
                    ajaxArgs = $.ajax.mostRecentCall.args[0]
                    ajaxArgs.success(FlackFixtures.comments)

                it "sets the commentText property", ->
                    expect(@grabber.commentText).toBeDefined()
