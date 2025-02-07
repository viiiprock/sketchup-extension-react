import App from "../components/App.tsx";
import { describe, it, expect, vi, beforeEach } from "vitest";
import { fireEvent, render, screen } from "@testing-library/react";

describe(App.name, () => {
  beforeEach(() => {
    window.sketchup = {
      callRubyMethod: vi.fn(),
    };
  });

  it("should render the component", () => {
    render(<App />);
    expect(screen.getByText("SketchUp Extension")).toBeInTheDocument();
    expect(
      screen.getByRole("button", { name: "Call Ruby Method" }),
    ).toBeInTheDocument();
  });

  it("should call the Ruby method", () => {
    render(<App />);
    fireEvent.click(screen.getByRole("button", { name: "Call Ruby Method" }));
    expect(window.sketchup.callRubyMethod).toHaveBeenCalled();
  });
});
