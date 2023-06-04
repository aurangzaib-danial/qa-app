import { Controller } from "@hotwired/stimulus"

import { patch } from '@rails/request.js'

// Connects to data-controller="notifications"
export default class extends Controller {
  static targets = ["unreadCount", "recent"]
  
  markAsRead() {
    if (parseInt(this.unreadCountTarget.innerHTML) > 0) {
      this.unreadCountTarget.innerHTML = "0"
      this.unreadCountTarget.classList.add("d-none")
      
      patch("/notifications/mark_as_read")
    }
  }

  markAsReadLocal() {
    const unread_li = this.recentTarget.getElementsByClassName("unread")
    Array.from(unread_li).forEach(li => li.classList.remove("unread"))
  }
}

