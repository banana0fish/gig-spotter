import React from 'react'
import { Router, browserHistory, Route, IndexRoute, Link } from 'react-router';

import NavBar from './components/NavBar';
import BandIndex from './pages/BandIndex'
import NewBandPage from './pages/NewBandPage'
import BandShowPage from './pages/BandShowPage'
import BookerIndex from './pages/BookerIndex'
import NewBookerPage from './pages/NewBookerPage'
import BookerShowPage from './pages/BookerShowPage'
import ConcertShowPage from './pages/ConcertShowPage'
import NewConcertPage from './pages/NewConcertPage'
import ConcertIndexPage from './pages/ConcertIndexPage'

export const App = (props) => {
  return (
  <Router history={browserHistory}>
    <Route path='/' component={NavBar} >
      <IndexRoute component={BandIndex}/>
      <Route path='bands/new' component={NewBandPage}/>
      <Route path="/bands/:id" component={BandShowPage}/>
      <Route path='/bookers' component={BookerIndex}/>
      <Route path='/bookers/new' component={NewBookerPage}/>
      <Route path='/bookers/:id' component={BookerShowPage}/>
      <Route path='/concerts' component={ConcertIndexPage}/>
      <Route path='/concerts/:id' component={ConcertShowPage}/>
      <Route path='/concerts/new' component={NewConcertPage}/>
    </Route>
  </Router>
  )
}

export default App
