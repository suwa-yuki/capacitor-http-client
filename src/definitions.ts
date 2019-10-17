declare module "@capacitor/core" {
  interface PluginRegistry {
    HTTPClient: HTTPClientPlugin;
  }
}

export interface HTTPClientPlugin {
  request(options: { 
    url: string,
    method: string,
    body: any,
    headers: [any]
  }): Promise<any>;
}
