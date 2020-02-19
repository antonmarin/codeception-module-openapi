# codeception-module-openapi
Module for codeception to test server over OpenAPI specification

```
public function testSpec(): void
{
  $I->haveSpecification('swagger/swagger.yaml');
  $I->loadFixtures(Fixture::class);
  
  $I->assertSpecificationImplemented('/orders/{orderId}');
}
```
