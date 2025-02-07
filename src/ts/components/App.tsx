import { FC, useState } from "react";

const App: FC = () => {
  const [message, setMessage] = useState<string>("");

  const callRubyMethod = () => {
    window.sketchup.callRubyMethod("Hello_From_JS", (response: string) => {
      setMessage(response);
    });
  };

  return (
    <div>
      <h1>SketchUp Extension</h1>
      <button onClick={callRubyMethod}>Call Ruby Method</button>
      {message && <p className="mt-4">{message}</p>}
    </div>
  );
};

export default App;
