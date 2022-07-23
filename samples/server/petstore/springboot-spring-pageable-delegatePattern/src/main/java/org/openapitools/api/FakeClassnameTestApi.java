/**
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech) (6.1.0-SNAPSHOT).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */
package org.openapitools.api;

import org.openapitools.model.Client;
import io.swagger.annotations.*;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import javax.validation.constraints.*;
import java.util.List;
import java.util.Map;
import javax.annotation.Generated;

@Generated(value = "org.openapitools.codegen.languages.SpringCodegen")
@Validated
@Api(value = "fake_classname_test", description = "the fake_classname_test API")
public interface FakeClassnameTestApi {

    default FakeClassnameTestApiDelegate getDelegate() {
        return new FakeClassnameTestApiDelegate() {};
    }

    /**
     * PATCH /fake_classname_test : To test class name in snake case
     * To test class name in snake case
     *
     * @param body client model (required)
     * @return successful operation (status code 200)
     */
    @ApiOperation(
        tags = { "fake_classname_tags 123#$%^" },
        value = "To test class name in snake case",
        nickname = "testClassname",
        notes = "To test class name in snake case",
        response = Client.class,
        authorizations = {
            @Authorization(value = "api_key_query")
         }
    )
    @ApiResponses({
        @ApiResponse(code = 200, message = "successful operation", response = Client.class)
    })
    @RequestMapping(
        method = RequestMethod.PATCH,
        value = "/fake_classname_test",
        produces = { "application/json" },
        consumes = { "application/json" }
    )
    default ResponseEntity<Client> testClassname(
        @ApiParam(value = "client model", required = true) @Valid @RequestBody Client body
    ) {
        return getDelegate().testClassname(body);
    }

}