# codeception-module-openapi
Module for [codeception](https://codeception.com/) to test server over OpenAPI specification

## Installation

Add to composer requirements
```
composer require antonmarin/codeception-module-openapi
```
Enable module in codeception
```
functional.suite.yml

modules:
   enabled:
       - OpenAPI:
           depends: REST
```

## Usage

```
public function testSpec(): void
{
  $I->haveSpecification('swagger/swagger.yaml');
  $I->loadFixtures(Fixture::class);
  
  $I->assertSpecificationImplemented('/orders/{orderId}');
}
```
