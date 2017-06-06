import React, { Component } from 'react';
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'
import logo from './logo.svg';
import './App.css';

class App extends Component {
  constructor () {
   super()
   this.state = {}
   this.getEntities = this.getEntities.bind(this)
   this.getEntity = this.getEntity.bind(this)
 }
 componentDidMount () {
   this.getEntities()
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
   this.fetch('api/entities')
     .then(entities => {
       this.setState({entities: entities})
       this.getEntity(entities[0].id)
     })
 }
 getEntity (id) {
   this.fetch(`api/entities/${id}`)
     .then(entity => this.setState({entity: entity}))
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
     <Dimmer active inverted>
       <Loader content='Loading' />
     </Dimmer>
   </Container>
 }
}

export default App;
