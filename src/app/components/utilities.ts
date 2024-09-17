import { countryCodeFormats } from "@/api/utilities";

export function capitalize(str: string) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

export function formatPhoneNumber(country: string, phone: bigint) {
  const phoneData = countryCodeFormats.find(record => record.name == country);

  if (phoneData) {
    let formattedNumber = '';
    let numberIndex = 0;

    for (let i = 0; i < phoneData.format.length; i++) {
      formattedNumber += phoneData.format[i] === '#' 
        ? phone.toString()[numberIndex++] 
        : phoneData.format[i];
    }
    
    return `+${phoneData.code} ${formattedNumber}`;
  } else {
    return 'No phone available or invalid'
  }
}