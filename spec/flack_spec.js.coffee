root = exports ? this

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

        it "generates the correct URL", ->
            # this filter is from the SE API to only include the body field
            expect(@grabber.url()).toBe("http://api.stackexchange.com/2.0/users/126042/answers?sort=activity&site=stackoverflow&filter=!*LJ9JtBkumiy6i6I")
