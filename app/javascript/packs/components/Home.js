import React from 'react';
import { withStyles } from '@material-ui/core/styles';

import Typography from "@material-ui/core/Typography";


const styles = theme => {
  return ({

  });
};

class Home extends React.Component {
  render() {
    return (
      <div>
        <Typography style={{color: 'black'}}>CA MARCHE</Typography>
      </div>
    );
  }
}

export default withStyles(styles)(Home);
