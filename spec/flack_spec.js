describe("FlackOverstow", function() {
    describe("Grabber", function() {
        beforeEach(function() {
            this.grabber = new FlackOverstow.Grabber(5);
        });

        it("initializes with the supplied id", function() {
            expect(this.grabber.id).toBe(5);
        });

        it("has the right filter", function() {
            // this filter is from the SE API to only include the body field
            expect(this.grabber.filter).toBe("!*LJ9JtBkumiy6i6I");
        });

        it("defaults the site to stackoverflow", function() {
            expect(this.grabber.site).toBe("stackoverflow");
        });

        it("defaults the sort to activity", function() {
            expect(this.grabber.sort).toBe("activity");
        });

        it("generates the correct URL", function() {
            expect(this.grabber.url()).toBe("http://api.stackexchange.com/2.0/users/126042/answers?sort=activity&site=stackoverflow&filter=!*LJ9JtBkumiy6i6I")
        });
    });
});
