import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class Counter extends Component {
  constructor(props) {
    super(props)
    this.state = {
      count: props.count
    }
  }

  hundleUp = () => {
    this.setState ({
      count: ++this.state.count
    })
  }

  hundleDown = () => {
    this.setState ({
      count: --this.state.count
    })
  }

  render() {
    return (
      <div>
        <div>{ this.state.count }</div>
        <button onClick={ this.hundleUp }>＋</button>
        <button onClick={ this.hundleDown }>ー</button>
      </div>
    )
  }
}

Counter.defaultProps = {
  count: 0
}

Counter.propTypes = {
  count: PropTypes.number
}
