import { useMemo } from 'react';
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Brush,
  ResponsiveContainer,
  ReferenceLine,
} from 'recharts';

export const WeldingChart = ({
  secondsPerPoint,
  values,
  lineColor,
  XAxisLabel,
  YAxisLabel,
  min,
  max,
  minLabel,
  maxLabel,
}) => {
  const minYAxisValue = useMemo(
    () => Math.min(...values, min) - 10,
    [values, min]
  );
  const maxYAxisValue = useMemo(
    () => Math.max(...values, max) + 10,
    [values, max]
  );

  const getChartValues = () => {
    let startSeconds = 0;

    const chartValues = values.map(_ => {
      startSeconds += secondsPerPoint;

      return {
        value: _,
        s: parseFloat(startSeconds).toFixed(2),
      };
    });

    return chartValues;
  };

  return (
    <ResponsiveContainer width="100%" height={350}>
      <LineChart
        data={getChartValues()}
        margin={{
          top: 10,
          right: 30,
          left: 10,
          bottom: 0,
        }}>
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis
          dataKey="s"
          label={{
            value: XAxisLabel,
            position: 'insideBottom',
            offset: 30,
          }}
          height={70}
        />
        <YAxis
          tickCount={10}
          domain={[minYAxisValue, maxYAxisValue]}
          label={{
            value: YAxisLabel,
            angle: -90,
            position: 'insideLeft',
            offset: 10,
            style: { textAnchor: 'middle' },
          }}
        />
        <Tooltip />
        <Line
          type="monotone"
          dataKey="value"
          stroke={lineColor}
          fill={lineColor}
          dot={false}
          strokeWidth={3}
        />
        {(min !== undefined || min !== null) && (
          <ReferenceLine
            y={min}
            stroke="red"
            strokeDasharray="3 3"
            label={minLabel}
            strokeWidth={2}
          />
        )}
        {(max !== undefined || max !== null) && (
          <ReferenceLine
            y={max}
            stroke="green"
            strokeDasharray="3 3"
            label={maxLabel}
            strokeWidth={2}
          />
        )}
        <Brush />
      </LineChart>
    </ResponsiveContainer>
  );
};
