import React, { Component } from 'react'
import PropTypes from 'prop-types'

export default class FollowButton extends Component {
  constructor(props) {
    super(props)
    
    this.state = {
      loading: false,
      relationship: props.relationship
    }
  }
  
  follow = () => {
    this.setState({
      loading: true
    })
    
    $.ajax({
      url: `/relationships`,
      dataType: 'json',
      contentType: 'application/json',
      type: 'POST',
      data: JSON.stringify({
        followed_id: this.props.user.id
      }),
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      cache: false
    }).then((response) => {
      console.log(response)
      this.setState({
        loading: false,
        relationship: response
      })
    })
  }
  
  unfollow = () => {
    this.setState({
      loading: true
    })

    $.ajax({
      url: `/relationships/${this.state.relationship.id}`,
      dataType: 'json',
      contentType: 'application/json',
      type: 'DELETE',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
      },
      cache: false
    }).then((response) => {
      this.setState({
        loading: false,
        relationship: null
      })
    })
  }
  
  handleClickFollowButton = () => {
    if (this.state.relationship !== null) {
      this.unfollow()
    }
    else {
      this.follow()
    }
  }
  
  render() {
    let className = ''
    if (this.state.relationship !== null) {
      className += 'btn btn-danger'
    }
    else {
      className += 'btn btn-primary'
    }
    
    return (
      <div>
        <button className={ className } onClick={ this.handleClickFollowButton } disabled={ this.state.loading }>
          { this.state.relationship !== null ? 'Unfollow' : 'Follow' }
        </button>
      </div>
    )
  }
}

FollowButton.defaultProps = {
  relationship: null
}

FollowButton.propTypes = {
  relationship: PropTypes.object,
  user: PropTypes.object.isRequired
}
