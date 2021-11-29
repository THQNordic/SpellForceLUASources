-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 296.947968 , 318.493683 , 33.783131 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(284.407,315.072,26.000);]] )
   Camera:MotionSpline_AddSplinePoint( 296.947968 , 318.493683 , 33.783131 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(284.407,315.072,26.000);]] )
   Camera:MotionSpline_AddSplinePoint( 296.947906 , 318.493652 , 33.783131 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(284.407,315.072,26.000);]] )
   Camera:MotionSpline_AddSplinePoint( 296.947968 , 318.493683 , 33.783131 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(284.407,315.072,26.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
