import React, { Component } from 'react';
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'
import logo from './logo.svg';
import './App.css';
import $ from 'jquery';

class Entity extends Component {
  constructor () {
   super()
   this.state = {}
   this.getEntities = this.getEntities.bind(this)
   this.getEntity = this.getEntity.bind(this)
 }
 componentDidMount () {
   if(sessionStorage.user){
     this.getEntities()
   }
 }
 fetch (endpoint) {
   return new Promise((resolve, reject) => {
     window.fetch(endpoint)
     .then(response => response.json())
     .then(json => resolve(json))
     .catch(error => reject(error))
   })
 }
 getEntities () {
   $.ajax({
     type: 'GET',
     url: 'api/entities',
     dataType: 'JSON',
     headers: JSON.parse(sessionStorage.user)
   })
   .done((data) => {
     this.setState({entities: data})
     this.getEntity(data[0].id)
   })
 }
 getEntity (id) {
   $.ajax({
     type: 'GET',
     url: 'api/entities/' + id,
     dataType: 'JSON',
     headers: JSON.parse(sessionStorage.user)
   })
   .done((data) => {
     this.setState({entity: data})
   })
 }
 render () {
   let {entities, entity} = this.state
   return entities
   ? <Container text>
       <Header as='h2' icon textAlign='center'>
       <Icon name='edit' circular />
       <Header.Content>
         List of Businesses
       </Header.Content>
     </Header>
     <Button.Group fluid widths={entities.length}>
       {Object.keys(entities).map((key) => {
         return <Button active={entity && entity.id === entities[key].id} fluid key={key} onClick={() => this.getEntity(entities[key].id)}>
           {entities[key].name}
         </Button>
       })}
     </Button.Group>
     <Divider hidden />
     {entity &&
       <Container>
         <Header as='h2'>{entity.name}</Header>
         {entity.id && <p>{entity.details}</p>}
       </Container>
     }
   </Container>
   : <Container text>

   </Container>
 }
}

export default Entity;
