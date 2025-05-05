import { LightningElement, api } from 'lwc';

export default class Navigation extends LightningElement {
    @api myImageUrl;

    connectedCallback() {
        // Default image URL if none is provided
        if (!this.myImageUrl) {
            this.myImageUrl = 'https://example.com/default-image.png';
        }
    }
    handleNavClick(event){
        console.log('Navigation item clicked');
    }
}
