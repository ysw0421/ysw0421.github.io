const object = { foo: 42 };
Object.getOwnPropertyDescriptor(object, 'foo');
// => {value: 42, writable: true, enumerable: true, configurable: true}
