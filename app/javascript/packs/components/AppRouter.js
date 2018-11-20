import React from 'react';
import { BrowserRouter, Route, Switch } from 'react-router-dom'

import Home from "./Home"

class AppRouter extends React.Component {
  render() {
    return (
      <BrowserRouter>
        <Route
          render={({ location }) => (
            <Switch location={location}>
              <Route exact path='/' component={Home} />
            </Switch>
          )}
        />
      </BrowserRouter>
    );
  }
}

export default AppRouter;
