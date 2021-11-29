-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 631.305786 , 290.183746 , 31.973923 , 24.900059 , [[Camera:ScriptSplineLookAtPosition(612.580,277.773,31.800);]] )
   Camera:MotionSpline_AddSplinePoint( 631.702454 , 284.413208 , 31.885353 , 16.500027 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 632.049133 , 278.493347 , 31.834511 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 632.400330 , 272.575256 , 31.983932 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
