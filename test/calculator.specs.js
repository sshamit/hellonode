describe("Calculator Spec", function() {
    it("should add two and two and get four as a result", function() {
        // Arrange
        var calculator = new Calculator();
 
        // Act
        var result = calculator.add(2, 2);
 
        // Assert
        expect(result).toBe(4);
    });
});
