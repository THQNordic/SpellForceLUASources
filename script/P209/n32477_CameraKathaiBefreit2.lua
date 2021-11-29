-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 497.583618 , 350.355957 , 44.016403 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(528.000,351.403,7.000);]] )
   Camera:MotionSpline_AddSplinePoint( 497.583618 , 350.355957 , 44.016403 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(528.000,351.403,7.000);]] )
   Camera:MotionSpline_AddSplinePoint( 497.583618 , 350.355957 , 44.016403 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(528.000,351.403,7.000);]] )
   Camera:MotionSpline_AddSplinePoint( 497.583618 , 350.355957 , 44.016403 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(528.000,351.403,7.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
