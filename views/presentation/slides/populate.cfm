<h3>Populate the Productivity!</h3>
<pre>
var fakeForm = {
    Year = 2012,
    AcquisitionDate = "2013-12-15",
    VIN = "VIN123-GJH-1923",
    ListPrice = 14500,
    Make = 6,
    Model = 14,
    Color = 9
};
var newCar = CarService.new();
prc.newCar = CarService.populate( 
    target=newCar, 
    memento=fakeform, 
    composeRelationships=true 
);
</pre>
<cfdump var="#prc.newCar#" expand="false">