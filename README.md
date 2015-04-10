## Syphon

Easily serialize forms into a JSON representation. Inspired from [Backbone.Syphon](https://github.com/marionettejs/backbone.syphon).

```html
<form id="new">
  <input type="text" name="name" value="mrZombie" />
  <input type="text" name="lvl" value="25" />
</form>
```

Will become : 

```json
{
  "name": "mrZombie",
  "lvl": "25"
}
```

## Installation 

```
bower install --save gotham-syphon
```

## Examples

### Basic
```html
<form id="tweet">
  <input type="text" name="title" value="My super tweet" />
  <input type="text" name="nickname" value="Nobody" />
</form>
```

```javascript
syphon = new Syphon();
datas = syphon.get('#tweet');

console.log(datas);

/*
Will return :
{
  "title": "My super tweet",
  "nickname": "Nobody"
}
*/
```

### Exclude some datas

```html
<form class="new_user">
  <input type="text" name="username" value="Peter" />
  <textarea name="description">I'm peter from London</textarea>
  <input type="password" name="password" value="secret" />
</form>
```

```javascript
syphon = new Syphon();
datas = syphon.exclude(['description', 'password']).get('.new_user');

console.log(datas);

/* Will return : 
{
  "username": "Peter"
}
*/
```

If you want a better syntax you can use the "arguments way" :

```javascript
datas = syphon.exclude('description', 'password').get('.new_user');
```



## Api

####```get(selector)```

Fetch datas from a form and convert as a JSON.

```javascript
syphon = new Syphon();
datas = syphon.get('#jquery-selector');
datas = syphon.get('.maybe-that');
datas = syphon.get('[data-toggle="that-too"]');
```

####```exclude(datas)```

Exclude some datas which will fetched by get.

```javascript
syphon = new Syphon();
datas = syphon.exclude('awesomeness').get('form:first');
datas = syphon.exclude('pretty', 'cool', 'syntax').get('form');
datas = syphon.exclude(['as', 'an', 'array']').get('form');
```

## How to compile source files 

In the root of the project, execute that : 

```
coffee --compile --watch --output dist/ src/
```

## Tests 
Test are written with Qunit, just launch with your browser the file ```tests/index.html```
