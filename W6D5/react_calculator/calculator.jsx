import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    this.state = {num1: "", num2: "", result: 0};
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.plus = this.plus.bind(this);
    this.minus = this.minus.bind(this);
    this.times = this.times.bind(this);
    this.divide = this.divide.bind(this);
    this.plus = this.plus.bind(this);
    this.reset = this.reset.bind(this);
  }

  setNum1(e) {
    e.preventDefault();
    const num1 = e.target.value;
    this.setState({num1});
  }

  setNum2(e) {
    e.preventDefault();
    const num2 = e.target.value;
    this.setState({num2});
  }

  plus () {
    let result = (Number(this.state.num1) + Number(this.state.num2));
    this.setState({result});
  }

  minus () {
    let result = (Number(this.state.num1) - Number(this.state.num2));
    this.setState({result});
  }

  times () {
    let result = (Number(this.state.num1) * Number(this.state.num2));
    this.setState({result});
  }

  divide () {
    let result = (Number(this.state.num1) / Number(this.state.num2));
    this.setState({result});
  }

  reset () {
    this.setState({num1: "", num2: "", result: 0});
    this.render();
  }

  render(){
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="number" placeholder="number" value={this.state.num1} onChange={this.setNum1}/>
        <input type="number" placeholder="number" value={this.state.num2} onChange={this.setNum2}/>
        <button onClick={this.reset}>Clear</button>
          <br/>
        <button onClick={this.plus}>+</button>
        <button onClick={this.minus}>-</button>
        <button onClick={this.times}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;
