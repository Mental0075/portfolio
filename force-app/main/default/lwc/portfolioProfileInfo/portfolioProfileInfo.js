import { LightningElement } from 'lwc';
import profilePic from '@salesforce/resourceUrl/mobin_akhtar';
export default class PortfolioProfileInfo extends LightningElement {
    portfolioUserImageUrl = profilePic; // Default image URL
    handleViewWork() {
        // Replace with actual navigation logic or event
        alert('Navigating to project section...');
      }
}