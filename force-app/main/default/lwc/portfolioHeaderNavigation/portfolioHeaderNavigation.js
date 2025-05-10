import { LightningElement, api, track } from 'lwc';

export default class Navigation extends LightningElement {
    @track isMenuOpen = false;

    get menuClass() {
        return this.isMenuOpen ? 'show-menu' : '';
    }

    toggleMenu() {
        this.isMenuOpen = !this.isMenuOpen;
    }
}
