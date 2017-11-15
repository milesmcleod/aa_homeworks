import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {

  constructor(props) {
    super(props);
    this.state = { term: "" };
  }

  updateTerm(e) {
    const term = e.currentTarget.value;
    // console.log(term);
    this.setState({term});
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.fetchSearchGiphys(this.state.term);
  }

  render() {
    return (
      <div>
        <form className='search-bar'>
          <input onChange={(e) => this.updateTerm(e)} type="text"/>
          <input onClick={(e) => this.handleSubmit(e)}type="submit" value="Search Giphy"/>
        </form>
        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
