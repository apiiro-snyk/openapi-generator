/* tslint:disable */
/* eslint-disable */
/**
 * OpenAPI Petstore
 * This spec is mainly for testing Petstore server and contains fake endpoints, models. Please do not use this for any other purpose. Special characters: \" \\
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

import { exists, mapValues } from '../runtime';
import type { Animal } from './Animal';
import {
    AnimalFromJSON,
    AnimalFromJSONTyped,
    AnimalToJSON,
} from './Animal';

/**
 * 
 * @export
 * @interface Dog
 */
export interface Dog extends Animal {
    /**
     * 
     * @type {string}
     * @memberof Dog
     */
    breed?: string;
}

/**
 * Check if a given object implements the Dog interface.
 */
export function instanceOfDog(value: object): boolean {
    let isInstance = true;

    return isInstance;
}

export function DogFromJSON(json: any): Dog {
    return DogFromJSONTyped(json, false);
}

export function DogFromJSONTyped(json: any, ignoreDiscriminator: boolean): Dog {
    if ((json === undefined) || (json === null)) {
        return json;
    }
    return {
        ...AnimalFromJSONTyped(json, ignoreDiscriminator),
        'breed': !exists(json, 'breed') ? undefined : json['breed'],
    };
}

export function DogToJSON(value?: Dog | null): any {
    if (value === undefined) {
        return undefined;
    }
    if (value === null) {
        return null;
    }
    return {
        ...AnimalToJSON(value),
        'breed': value.breed,
    };
}
