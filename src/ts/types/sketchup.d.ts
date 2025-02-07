// declare global variable for sketchup method here
declare interface Window {
  sketchup: {
    callRubyMethod: (methodName: string, ...args: any[]) => void;
  };
}