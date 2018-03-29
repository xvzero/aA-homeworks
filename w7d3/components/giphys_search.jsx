import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  render() {
    return <GiphysIndex giphys={this.props.giphys}/>
  }
}
