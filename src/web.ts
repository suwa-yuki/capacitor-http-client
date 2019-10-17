import { WebPlugin } from '@capacitor/core';
import { HTTPClientPlugin } from './definitions';

export class HTTPClientWeb extends WebPlugin implements HTTPClientPlugin {
  constructor() {
    super({
      name: 'HTTPClient',
      platforms: ['web']
    });
  }

  async request(options: { 
    url: string,
    method: string,
    body: any,
    headers: [any]
  }): Promise<any> {
    console.log('ECHO', options);
    return options;
  }
}

const HTTPClient = new HTTPClientWeb();

export { HTTPClient };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(HTTPClient);
